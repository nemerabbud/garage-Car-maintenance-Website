<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\PlanRequest;
use App\Models\Language;
use App\Models\Page;
use App\Models\Plan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

class PagesController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->route = "pages";
        $this->path = "admin.pages";
    }


    public function index()
    {
        $pages = Page::all();
        return view("{$this->path}.home", compact('pages'));
    }


    public function create()
    {
        return view("{$this->path}.create");
    }


    public function store(Request $request)
    {
        $locales = Language::all()->pluck('lang');

        $roles = [

            'image' => 'nullable|image',


        ];
        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.title"] = 'required|string';
            $roles["$locale.description"] = 'required|string';
        }
        $data = $this->validate($request, $roles);

        if ($request->has('image'))
            $data['image']=storeImage($request->file('image'),'pages');

        Page::create($data);


        return redirect()->back()->with('status', __('cp.create'));
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Page $page
     * @return \Illuminate\Http\Response
     */
    public function edit(Page $page)
    {

        return view("{$this->path}.edit", ['item' => $page]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param Page $page
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Page $page)
    {

        $locales = Language::get()->pluck('lang');

        $roles = [

            'image' => 'nullable|image',


        ];
        foreach ($locales as $locale) {
            $roles[$locale] = 'required|array';
            $roles["$locale.title"] = 'required|string';
            $roles["$locale.description"] = 'required|string';
        }
        $data = $this->validate($request, $roles);

        if ($request->has('image'))
            $data['image']=storeImage($request->file('image'),'pages',$page->image);

        $page->update($data);

        return redirect()->back()->with('status', __('cp.update'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Page $page
     * @return \Illuminate\Http\Response
     */
    public function destroy(Page $page)
    {

        $page->delete();
        return response()->json(['status' => true, 'message' => 'success']);


    }
}
