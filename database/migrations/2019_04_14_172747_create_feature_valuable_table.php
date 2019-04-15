<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFeatureValuableTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('feature_valuable', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('feature_value_id');
            $table->foreign('feature_value_id')->references('id')->on('feature_values')->onDelete('cascade');
            $table->enum('target_type',
                [
                    'product',
                    'product_modification',
                ]);
            $table->unsignedBigInteger('target_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('feature_valuable');
    }
}
