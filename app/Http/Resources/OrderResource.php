<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {


        return  [
            'id' => $this->id,
            'user_name' =>$this->user->name,
            'created_at' =>$this->created_at,
            'status' =>$this->status,
            'services' =>ServiceResource::collection($this->services),


        ];
    }
}
