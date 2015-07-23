	/*
	 * This function iterate TR and find TD by Id's and count lablig price
	 */
	function countLabldingPriceOnForm(productId) {
			var buyingPrice = $(this).find('#buyingPrice').val();
			var profitPercentage = $(this).find('#profitPercentage').val();
			var lablingPrice = buyingPrice * (profitPercentage*1 + 100.00) / 100;
			$(this).find('#productLabelingPrice').val(lablingPrice);
	}
	
	function makeInputField(rowId){
		//alert("clicked"+rowId);
		
		$('#'+rowId+' input').css('display', 'inline-block');
		$('#'+rowId+' div').css('display', 'none');
		
		$('#'+rowId).find('select').css('display', 'inline-block');
	}

	function closeInputField(rowId){
		//alert("clicked"+rowId);
		
		$('#'+rowId+' input').css('display', 'none');
		$('#'+rowId+' div').css('display', 'inline-block');
		
		$('#'+rowId).find('select').css('display', 'none');

	}
		
		/*
		 * This function iterate TR and find TD by Id's and count lablig price
		 */
		function showSaveButton(id) {
		    $("#"+id).each(function(){
				$(this).find('#btn_edit_'+id).hide();
				$(this).find('#btn_save_'+id).show();
		    });
		}
		
		function deleteProduct(id) {
			
			$('<div></div>').appendTo('body')
		    .html('<div><h6>Do you want to permanenly Delete this product from the system ?</h6></div>')
		    .dialog({
		    modal: true,
		    title: 'Delete Warning message for Product ID : ' + id,
		    zIndex: 10000,
		    autoOpen: true,
		    width: 'auto',
		    resizable: false,
		    buttons: {
		        Yes: function () {
		        	 $.ajax({url: "/sdnext/deleteExternalItem.html?id="+id,	        	
		     	        success: function(result){
		     	    		$('#alert').css('display', 'inline-block');
		     	            $("#alert").html("Product Id " + id + "  successfully deleted ");
		     	            $('#'+id).hide();
		     	    	}
		     	    });
		            $(this).dialog("close");
		        },
		        No: function () {
		            //doFunctionForNo();
		            $(this).dialog("close");
		        }
		    },
		    close: function (event, ui) {
		        $(this).remove();
		    }
		});
	  
		}
		
		
		function selectDiv(divId) {
			$('.mainDiv').each(function(index) {
				  var id = $(this).attr('id');
				  aler("Id : "+id);
				  
				  	if(divId == id) {
				  		$(this).show();
				  	} else {
				  		$(this).hide();
				  	}
				});
		}
		

	
	