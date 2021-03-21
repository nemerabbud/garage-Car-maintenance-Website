<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GarageInfoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {

        $data = [
            'id' => $this->id,
            'name' => $this->name,
            'owner_name' => $this->user->name,
            'email' => $this->user->email,
            'mobile' => $this->user->mobile,
            'image' => $this->user->image_url,
            'description' => $this->description,
            'address' => $this->address,
            'rate' => $this->rate,
            'distance' => $this->distance,
            'created_at' => $this->created_at,
            'lat' => $this->lat,
            'lng' => $this->lng,
            'category' => new CategoryResource($this->category),
            'images' => ImageResource::collection($this->images),
            'car_types' => CarTypeResource::collection($this->carTypes),
          //  'reviews' => ReviewResource::collection($this->reviews),
            'services' => ServiceResource::collection($this->services),

        ];


        return $data;
    }
}
