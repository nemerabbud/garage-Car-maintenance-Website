<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderInfoResource extends JsonResource
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
            'created_at' => $this->created_at,
            'status' => $this->status,
            'date' => $this->date,
            'time' => $this->time,
            'description' => $this->description,
            'is_reviewed' => $this->is_reviewed,
            'images' => ImageResource::collection($this->images),
            'services' => ServiceResource::collection($this->services),
        ];
        if (auth()->user()->role == 'garage') {
            $data['user'] = [
                'name' => $this->user->name,
                'mobile' => $this->user->mobile,
                'email' => $this->user->email,
            ];
        } else {
            $data['garage'] = //$this->garage;
            [
                'id' => $this->garage->id,
                'description' => $this->garage->description,
                'address' => $this->garage->address,
                'rate' => $this->garage->rate,
                'category' =>  new CategoryResource($this->garage->category),
                'name' => $this->garage->name,
                'lat' => $this->garage->lat,
                'lng' => $this->garage->lng,

                'user' => [
                    'name' => $this->garage->name,
                    'mobile' => $this->garage->user->mobile,
                    'image' => $this->garage->user->image_url   ,
                ],
                'images'=>ImageResource::collection($this->garage->images),
                'services'=>ServiceResource::collection($this->garage->services),
                'car_types'=>CarTypeResource::collection($this->garage->services),
            ];
//            [
//                'name' => $this->garage->user->name,
//                'mobile' => $this->garage->user->mobile,
//                'image' => $this->garage->user->image_url,
//                'category_title' => $this->garage->category->title,
//            ];
        }


        if (!empty($this->rejected_message))
            $data['rejected_message'] = $this->rejected_message;

        return $data;
    }
}
