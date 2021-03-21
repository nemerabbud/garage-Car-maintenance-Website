<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserGarageResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $data =  [
            'id' => $this->id,
            'name' => $this->name,
            'owner_name' =>$this->user->name ,
            'email' => $this->user->email,
            'mobile' => $this->user->mobile,
            'image' => $this->user->image_url,
            'description' => $this->description,
            'address' => $this->address,
            'rate' => $this->rate,
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
            'plan' => new PlanResource($this->plan),
            'category' => new CategoryResource($this->category),
            'images' => ImageResource::collection($this->images),
            'car_types' => CarTypeResource::collection($this->carTypes),
            'services' => ServiceResource::collection($this->services),
            'lat' => $this->lat,
            'lng' => $this->lng,
            'en' => [
                'name'=>@$this->translate('en')->name,
                'description'=>@$this->translate('en')->description,
                'address'=>@$this->translate('en')->address,

            ],
             'ar' => [
                'name'=>@$this->translate('ar')->name,
                'description'=>@$this->translate('ar')->description,
                'address'=>@$this->translate('ar')->address,

            ],


        ];


        return $data ;
    }
}
