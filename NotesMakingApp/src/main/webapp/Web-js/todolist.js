$(document).ready(
    function(){
        $('#addid').click(
            function(){
                $('#pop-containerid').show();
                $('#pop-containerid .listdiv').remove();
                $('#pop-containerid .header-part .title #titleinput').val('');
                $('.eachbox').removeClass('boxactive');
            }
        );
    }
 );

// to hide main popup 
$(document).ready(
    function(){
        $('#closebutton').click(
            function closeit(){
                $('#pop-containerid').hide();
                // $('#overlayid').hide();
            }
        );
    }
 );

// to show small popup
 $(document).ready(
     function addlist(){
         $('#addlistbutton').click(
            function open(){
                 $('#enter-litid').show();
             }
         );
     }
 );

 // cancel buuton
 $(document).ready(
    function close(){
        $('#cancel').click(
            function closeit(){
                $('#data-input').val("");
                $('#enter-litid').hide();
                // $('#overlayid').hide();
            }
        );
    }
 );

 // add lists to main pop up
 let listid = 1;
 function getlist(){
    var listdata = $('#data-input').val();
    if(listdata === ""){
        $('#enter-litid').hide()
        return
    }
    var list ='<input id="listCheckbox" type="checkbox" onclick=strikethis() value=>'+listdata
    var delbutton = '<button id="del" onclick=deleteThisItem(this)> DEL </button>'
    var datadiv = '<div>'+list+'</div>'
    var listdiv = '<div class="listdiv" id=list'+listid+' >'+datadiv+delbutton+'</div>'
    listid++
    alert(listdiv)
    return listdiv;
 }
 let lists = undefined
 let changes = false
 $(document).ready(
    function ok(){
        
        $('#ok').click(
            function addthis(){
                let listdiv = getlist();
                if(lists === undefined){
                    $('#lists').append(listdiv);
                    alert(0)
                }
                else{
                    $(lists).append(listdiv);
                    lists = undefined;
                    changes = true
                }
               $('#data-input').val("");
               $('#enter-litid').hide();
               $('.listdiv').css('background-color','darkseagreen');
            }
        );
    }
 );
$(document).ready(
    function() { // save button in popup
        let idcount = 1
        $('#pop-containerid #savebutton').click(
            function () {
                let title = $('#pop-containerid .header-part .title #titleinput').val()
                if(title.trim().length === 0){
                    alert('Enter the Title')
                    return;
                }

                let isempty =$('#pop-containerid #lists').find('div').text()
                let listCount = document.getElementById('lists').childElementCount;
                if(isempty.trim().length === 0 || listCount === 0){
                    alert('List is Empty')
                    return;
                }
                let eachbox = $('#pop-containerid').html();
                let newTitle ='<div class="title"><input type="text" id = "titleinput" value='+title+'></div>'  
                $('.list-container #box-containerid').append('<div class="eachbox" id=box'+idcount+' onclick=changeBoxPosition(this)>'+eachbox+'</div>');
                $('.eachbox').css("display", "block");
                $('#box'+idcount+' .header-part .title #titleinput').replaceWith(newTitle);
                $('#pop-containerid').hide();
                // $('#pop-containerid').remove();
                idcount++;             
            }  
        );
    }
);
let lastone = listid;
function hidepopup(close){
    if(changes === false){
        $('.eachbox').removeClass('boxactive');
    }
    else{
        let clicked = confirm(' Are u Sure ? \n Changes not commited..')
        if(clicked === true){
            for (let i = lastone+1; i < listid; i++) {
                $('#list'+i).remove();
                alert(i);
            }
            changes = false;
            listid = lastone;
            $('.eachbox').removeClass('boxactive');
        }
    }
    // sutthivalachu podura method is starts here, but useful for add and save buttons;

    // let headerid = close.parentNode.id
    // let btnsid = document.getElementById(headerid).parentNode.id;
    // let boxid = document.getElementById(btnsid).parentNode.id;
    // let clickedData = $('#'+$('#'+btnsid).parent()[0].id).find('input[type=text]').val()
    // let allbox = document.querySelectorAll(".eachbox")

    // allbox.forEach(element => {

    //     let id = element.id
    //     let boxdata = $('#'+id+' input[type=text]').val()
    //     // alert("click"+clickedData)
    //     // alert(boxdata)
    //     if(boxdata == clickedData){
    //         $('#'+id).removeClass('boxactive')
    //         $('#'+id).css("background-color","green")            
    //     }
    // });
}
function changeBoxPosition(box){

    $('#'+box.id).dblclick(
        function(){
            
                // alert('catched')
                $('#pop-containerid').hide();
                $('.eachbox').removeClass('boxactive');
                $(box).addClass('boxactive');
         
        }
    );
    
}
function deleteThisItem(thisbutton) {
    let listid = thisbutton.parentNode.id
    let parent_list = document.getElementById(listid).parentNode.id; // works like current class obj
    // let parent_box = $('#'+parent_list).parents()
    let allbox = document.querySelectorAll(".eachbox")
    
    let listCount = document.getElementById(parent_list).childElementCount;
    if(listCount === 1){
        let clicked = confirm('Are u Sure ?')
        if(clicked){
            let listdelete = confirm('Entire list will be deleted!!!')
            if(listdelete){
                $('#'+listid).remove();
                $('#'+listid).remove(); // if i give twice then only it works on each box else it will works only on popup container
                allbox.forEach(element => {
                    if($(element).find('#lists').html() === $('#'+parent_list).html()){
                        $(element).remove();
    
                        // remove from DB code
                        
                    }
                });
            }
        }
        return
    }
    // alert(listCount)
    $('#'+listid).remove();
    $('#'+listid).remove();// if i give twice then only it works on each box else it will works only on popup container
}

function addlist(add){
    let headerid = add.parentNode.id
    let btnsid = document.getElementById(headerid).parentNode.id;
    let boxid = document.getElementById(btnsid).parentNode.id;
    let clickedData = $('#'+$('#'+btnsid).parent()[0].id).find('input[type=text]').val()
    let allbox = document.querySelectorAll(".eachbox")

    allbox.forEach(element => {

        let id = element.id
        let boxdata = $('#'+id+' input[type=text]').val()
        // alert("click"+clickedData)
        // alert(boxdata)
        if(boxdata == clickedData){
            $('#enter-litid').show();
            $('#'+id).addClass('boxactive')
            lists = $('#'+id).find('#lists'); // important (like flag and it is the data)
        }
    });
}

function savelist(save){
    let headerid = save.parentNode.id
    let btnsid = document.getElementById(headerid).parentNode.id;
    let boxid = document.getElementById(btnsid).parentNode.id;
    let clickedData = $('#'+$('#'+btnsid).parent()[0].id).find('input[type=text]').val()
    let allbox = document.querySelectorAll(".eachbox")

    allbox.forEach(element => {

        let id = element.id
        let boxdata = $('#'+id+' input[type=text]').val()
        // alert("click"+clickedData)
        // alert(boxdata)
        if(boxdata == clickedData){
            // DB CODE
            // 1.
            // 2.

            changes = false;
            $('.eachbox').removeClass('boxactive');

        }
    });
}