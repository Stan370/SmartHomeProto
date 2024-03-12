/**
 * welcome.js
 */
const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });
function level(num){
	$.ajax({
        async:true,
        cache:false,
        url:"./BrightnessServlet",
        data:{"level":num},
        type:"post",
        dataType:"json",
        success:function(res) {
        	console.log(res);
           if(res){
        	   Toast.fire({
        	        icon: 'success',
        	        title: 'The modification was made successfully'
        	      })
    	      setTimeout(function(){
                  window.location.reload();
              },600);
           }else{
        	   Toast.fire({
       	        icon: 'error',
       	        title: 'Gear adjustment failed'
       	      })
           }
        }
    });
}

function level2(num){
	$.ajax({
        async:true,
        cache:false,
        url:"./SunshadeServlet",
        data:{"level2":num},
        type:"post",
        dataType:"json",
        success:function(res) {
        	console.log(res);
           if(res){
        	   Toast.fire({
        	        icon: 'success',
        	        title: 'The modification was made successfully'
        	      })
    	      setTimeout(function(){
                  window.location.reload();
              },600);   
           }else{
        	   Toast.fire({
       	        icon: 'error',
       	        title: 'The shutdown failed'
       	      })
           }
        }
    });
}
function level3(num){
	$.ajax({
        async:true,
        cache:false,
        url:"./HomeServlet",
        data:{"level3":num},
        type:"post",
        dataType:"json",
        success:function(res) {
        	console.log(res);
           if(res){
        	   Toast.fire({
        	        icon: 'success',
        	        title: 'The modification was made successfully'
        	      })
    	      setTimeout(function(){
                  window.location.reload();
              },600);   
           }else{
        	   Toast.fire({
       	        icon: 'error',
       	        title: 'Try failed.'
       	      })
           }
        }
    });
}
