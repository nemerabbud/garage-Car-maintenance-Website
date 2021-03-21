<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class NotificationsResource extends JsonResource
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
            'type' => $this->data['type'],
            'data' => [
                'title' => $this->data['title_' . app()->getLocale()],
                'message' => $this->data['message_' . app()->getLocale()],
            ],
            'created_at' => $this->created_at,


        ];
        if (isset($this->data['order_id']))
            $data['data']['order_id'] = $this->data['order_id'];
        return $data;
    }
}
