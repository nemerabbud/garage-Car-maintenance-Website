<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class RejectGarageRequest extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    protected  $email ;
    protected  $message ;
    public function __construct($email,$message)
    {
        $this->email = $email ;
        $this->message = $message ;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('emails.garage.reject_new_garage_request',['email'=>$this->email,'message'=>$this->message])
            ->subject('Your Request to create garage account is rejected');;
    }
}
