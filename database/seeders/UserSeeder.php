<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        user::factory()->create([
            'email' => 'admin@mail.com',
            'password' => bcrypt('12345678')
        ]);
        
        User::factory()->count(20)->create();
    }
}
