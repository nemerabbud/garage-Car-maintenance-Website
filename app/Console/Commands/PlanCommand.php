<?php

namespace App\Console\Commands;

use App\Models\Garage;
use Illuminate\Console\Command;

class PlanCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'plan:end_subscribe';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'End subscribe plane  by  garage';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

        Garage::whereDate('end_date','<',now())->orWhereNull('plan_id')->update(['status'=>'not_active']);

        return 'operation is done';
    }
}
