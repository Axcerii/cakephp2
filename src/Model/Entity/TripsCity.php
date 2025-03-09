<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * TripsCity Entity
 *
 * @property int $id
 * @property int $trip_id
 * @property int $city_id
 *
 * @property \App\Model\Entity\Trip $trip
 * @property \App\Model\Entity\City $city
 */
class TripsCity extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array<string, bool>
     */
    protected array $_accessible = [
        'trip_id' => true,
        'city_id' => true,
        'trip' => true,
        'city' => true,
    ];
}
