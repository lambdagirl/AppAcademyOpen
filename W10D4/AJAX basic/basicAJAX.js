// AJAX request: Asynchronous JavaScript And XML; make the HTTP request in the background 

// class WidgetsController < ApplicationController
//   def show
//     @widget = Widget.find(params[:id])
//     respond_to do |format|
//       format.html { render :show }
//       format.json { render json: @widget }
//     end
//   end

//   def create
//     @widget = Widget.create!(params[:widget])

//     respond_to do |format|
//       format.html { redirect_to widget_url(@widget) }
//       # it is common to render a newly created object.
//       # this is especially useful so that client-side code can
//       # access the `id` attribute of the newly created widget.
//       format.json { render json: @widget }
//     end
//   end
// end

$.ajax({
    url:"/widges/1.json",
    type:"GET",
    success:function(widgetData){
        console.log("HEre are the fetched json params of widget:");
        console.log(widgetData);
    },
    error: function(errMsg){
        console.log(errMsg);
    }
});

$.ajax({
    url:'/widgets.json',
    type:"POST",
    data:{
        widget:{
            name:'The Best Widget',
            maker:'The Widge King'
        }
    },
    success:function(widgetData){
        console.log("Widget created!");
        // `create` action should 1render json: @widget`
        //this gives the client access to the `id` attribute issued by server
        console.log("issued id:"+ widgetData.id);
    },
    error: function(errMsg){
        console.log(errMsg);
    }
})