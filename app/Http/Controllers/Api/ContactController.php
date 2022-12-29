<?php

namespace App\Http\Controllers\Api;

use App\Models\Contact;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class ContactController extends Controller
{
    public function getAllContact()
    {
        return response()->json(
            Contact::all());
    }

    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama'     => 'required|min:5',
            'alamat'   => 'required|min:10',
            'no_hp'   => 'required|min:11',
            'image'     => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:10240'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $image = $request->file('image');
        $image->storeAs('contacts', $image->hashName());

        $Contact = Contact::create([
            'nama'     => $request->nama,
            'alamat'   => $request->alamat,
            'no_hp'   => $request->no_hp,
            'foto'     => $image->hashName()
        ]);

        if($Contact) {
            return response()->json([
                'success' => true,
                'user'    => $Contact,
            ], 201);
        }

        return response()->json([
            'success' => false,
        ], 409);
    }
}
