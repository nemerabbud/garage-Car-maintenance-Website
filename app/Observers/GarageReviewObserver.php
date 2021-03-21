<?php

namespace App\Observers;

use App\Models\Garage;
use App\Models\GarageReview;

class GarageReviewObserver
{
    /**
     * Handle the garage review "created" event.
     *
     * @param  \App\Models\GarageReview  $garageReview
     * @return void
     */
    public function created(GarageReview $garageReview)
    {
        $garage = Garage::with('reviews')->find($garageReview->garage_id);
        $reviews = $garage->reviews;
        $count = $reviews->count();
        $sum = $reviews->sum('rate');
        $rate =$count == 0 ? 0 : number_format(($sum / $count), 2);
        $garage->update(['rate'=>$rate,'count_reviewers'=>$count]);
    }

    /**
     * Handle the garage review "updated" event.
     *
     * @param  \App\Models\GarageReview  $garageReview
     * @return void
     */
    public function updated(GarageReview $garageReview)
    {
        //
    }

    /**
     * Handle the garage review "deleted" event.
     *
     * @param  \App\Models\GarageReview  $garageReview
     * @return void
     */
    public function deleted(GarageReview $garageReview)
    {
        //
    }

    /**
     * Handle the garage review "restored" event.
     *
     * @param  \App\Models\GarageReview  $garageReview
     * @return void
     */
    public function restored(GarageReview $garageReview)
    {
        //
    }

    /**
     * Handle the garage review "force deleted" event.
     *
     * @param  \App\Models\GarageReview  $garageReview
     * @return void
     */
    public function forceDeleted(GarageReview $garageReview)
    {
        //
    }
}
