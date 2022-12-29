<?php

namespace App\Http\Controllers\Api;

use App\Models\Contact;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

class CrudController extends Controller
{

    public function store(Request $request)
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

        //return JSON process insert failed
        return response()->json([
            'success' => false,
        ], 409);
    }


    public function edit(Contact $contact)
    {
        return view('contacts.edit', compact('contact'));
    }


    public function update(Request $request, Contact $contact)
    {
        $Contactupdate='';
        $validator = Validator::make($request->all(), [
            'nama'     => 'required|min:5',
            'alamat'   => 'required|min:10',
            'no_hp'   => 'required|min:11',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        if ($request->hasFile('image')) {

            $image = $request->file('image');
            $image->storeAs('contacts', $image->hashName());

            Storage::delete('contacts/'.$contact->foto);

            $Contactupdate = $contact->update([
                'nama'     => $request->nama,
                'alamat'   => $request->alamat,
                'no_hp'   => $request->no_hp,
                'foto'     => $image->hashName()
            ]);

        } else {

            $Contactupdate = $contact->update([
                'nama'     => $request->nama,
                'alamat'   => $request->alamat,
                'no_hp'   => $request->no_hp,
            ]);
        }


        if($Contactupdate) {
            return response()->json([
                'success' => true,
                'user'    => $Contactupdate,
            ], 201);
        }

        //return JSON process insert failed
        return response()->json([
            'success' => false,
        ], 409);
    }

    public function destroy(Contact $contact)
    {
        $Contactupdate = Storage::delete('contacts/'.$contact->foto);

        $contact->delete();

        if($Contactupdate) {
            return response()->json([
                'success' => true,
                'user'    => $Contactupdate,
            ], 201);
        }

        //return JSON process insert failed
        return response()->json([
            'success' => false,
        ], 409);
    }
}
