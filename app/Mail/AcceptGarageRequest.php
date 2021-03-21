<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AcceptGarageRequest extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    protected   $email ;
    protected  $password ;
    public function __construct($email , $password)
    {
        $this->email = $email ;
        $this->password = $password ;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('emails.garage.accept_new_garage_request',['email'=>$this->email,'password'=>$this->password])
            ->subject('Your Request to create garage account is accepted');
    }
}
