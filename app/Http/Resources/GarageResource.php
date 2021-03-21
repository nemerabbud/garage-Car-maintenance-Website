<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GarageResource extends JsonResource
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
            'address' => $this->address,
            'name' => $this->name,
            'image' => $this->user->image_url,
            'distance' => $this->distance,
            'created_at' => $this->created_at

        ];
    }
}
