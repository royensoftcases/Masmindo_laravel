<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ContactController extends Controller
{


    public function index()
    {
        $contacts = Contact::latest()->paginate(5);

        return view('contacts.index', compact('contacts'));
    }

    public function create()
    {
        return view('contacts.create');
    }


    public function store(Request $request)
    {

        $this->validate($request, [
            'nama'     => 'required|min:5',
            'alamat'   => 'required|min:10',
            'no_hp'   => 'required|min:11',
            'image'     => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:10240'
        ]);

        $image = $request->file('image');
        $image->storeAs('contacts', $image->hashName());

        Contact::create([
            'nama'     => $request->nama,
            'alamat'   => $request->alamat,
            'no_hp'   => $request->no_hp,
            'foto'     => $image->hashName()

        ]);

        return redirect()->route('contacts.index')->with(['success' => 'Data Disimpan']);
    }


    public function edit(Contact $contact)
    {
        return view('contacts.edit', compact('contact'));
    }


    public function update(Request $request, Contact $contact)
    {

        $this->validate($request, [
            'nama'     => 'required|min:5',
            'alamat'   => 'required|min:10',
            'no_hp'   => 'required|min:11',
        ]);


        if ($request->hasFile('image')) {

            $image = $request->file('image');
            $image->storeAs('contacts', $image->hashName());

            Storage::delete('contacts/'.$contact->foto);

            $contact->update([
                'nama'     => $request->nama,
                'alamat'   => $request->alamat,
                'no_hp'   => $request->no_hp,
                'foto'     => $image->hashName()
            ]);

        } else {

            $contact->update([
                'nama'     => $request->nama,
                'alamat'   => $request->alamat,
                'no_hp'   => $request->no_hp,
            ]);
        }

        return redirect()->route('contacts.index')->with(['success' => 'Data Diubah']);
    }

    public function destroy(Contact $contact)
    {
        Storage::delete('contacts/'.$contact->foto);

        $contact->delete();

        return redirect()->route('contacts.index')->with(['success' => 'Data Dihapus']);
    }
}
