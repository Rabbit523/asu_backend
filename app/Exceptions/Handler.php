<?php

namespace App\Exceptions;

use Request;
use Response;
use Exception;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Symfony\Component\Debug\Exception\FatalThrowableError;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\UnprocessableEntityHttpException;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        ApiBaseException::class
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * This is a great spot to send exceptions to Sentry, Bugsnag, etc.
     *
     * @param  \Exception  $exception
     * @return void
     */
    public function report(Exception $exception)
    {
        if (app()->bound('sentry') && $this->shouldReport($exception)){
            app('sentry')->captureException($exception);
        }

        parent::report($exception);
    }

    /**
    * Render an exception into an HTTP response
    *
    * @param Request $request
    * @param Exception $e
    * @return Response
    */
    public function render($request, Exception $e)
    {
        return $request->expectsJson()
                ? $this->handle($request, $e)
                : parent::render($request, $e);
    }

    protected function unauthenticated($request, AuthenticationException $e)
    {
        return $request->expectsJson()
                ? response()->json($data, 401)
                : redirect()->guest(route('login'));
    }

    /**
    * Convert the Exception into a JSON HTTP Response
    *
    * @param Request $request
    * @param Exception $e
    * @return JSONResponse
    */
    private function handle($request, Exception $e) {

        if($e instanceof ValidationException) {
            $errors = $e->errors();
            $status = $e->status;

            array_walk($errors,
                function($value, $index) use (&$data, $errors, $status)
                {
                    $data[] = [
                        'id' => 'validation_errors',
                        'status' => $status,
                        'title' => $index,
                        'detail' => array_first($errors[$index])
                    ];
                }, $data);
        }
        elseif ($e instanceOf AuthenticationException) {
            $status = 401;

            $data = array_merge([
                'id' => 'invalid_credentials',
                'status' => $status
            ], config('errors.invalid_credentials'));
        }
        elseif ($e instanceOf HttpResponseException) {
            $data = $e->toArray();
            $status = $e->getStatus();
        }
        elseif ($e instanceOf ApiBaseException) {
            $data = $e->toArray();
            $status = $e->getStatus();
        }
        elseif ($e instanceOf NotFoundHttpException || $e instanceOf ModelNotFoundException) {
            $status = 404;

            $data = array_merge([
                'id' => 'not_found',
                'status' => $status
            ], config('errors.not_found'));
        }
        elseif ($e instanceOf MethodNotAllowedHttpException) {
            $status = 405;

            $data = array_merge([
                'id' => 'method_not_allowed',
                'status' => $status
            ], config('errors.method_not_allowed'));
        }
        elseif($e instanceOf FatalThrowableError){
            $data = $e->getMessage();
            $status = $e->getCode();
        }
        elseif($e instanceOf \ErrorException){
            $data = $e->getMessage();
            $status = $e->getCode();
        }
        elseif($e instanceOf \InvalidArgumentException){
            return parent::handle($e);
        }
        else{
            $data = $e->getMessage();
            $status = $e->getStatusCode();
        }

        if($status == 0){
            $status = 500;
        }

        return response()->json($data, $status);
    }
}
