function updateAuthors(author, ids){
    var authorName = author.options[author.selectedIndex].text;
    var authorId = author.options[author.selectedIndex].value;
    var o="removeAuthor('"+authorId+"','"+authorName+"')";
    var a='<img src=\'../../assets/delete.png\' width="12" height="12" onclick="'+o+'">';
    $("#authors-div").append("<div id='"+authorId+"'><a href='../authors/"+authorId+"'>"+authorName+"</a> "+a+"</div>");
    $("#authors_ids").val(ids+authorId+",");
    $("#authors option[value='"+authorId+"']").remove();
}

function removeAuthor(t,e){
    var i="#"+t;
    $(i).remove();
    $("#authors").append($("<option/>",{value:t,text:e}));
    var n=$("#authors_ids").val();
    n=n.replace(t+",","");
    $("#authors_ids").val(n)
}

function updateGroups(group, ids){
    var groupName = group.options[group.selectedIndex].text;
    var groupId = group.options[group.selectedIndex].value;
    var o="removeGroup('"+groupId+"','"+groupName+"')";
    var a='<img src=\'../../assets/delete.png\' width="12" height="12" onclick="'+o+'">';
    $("#groups-div").append("<div id='"+groupId+"'><a href='../groups/"+groupId+"'>"+groupName+"</a> "+a+"</div>");
    $("#groups_ids").val(ids+groupId+",");
    $("#groups option[value='"+groupId+"']").remove();
}

function removeGroup(t,e){
    var i="#"+t;
    $(i).remove();
    $("#groups").append($("<option/>",{value:t,text:e}));
    var n=$("#groups_ids").val();
    n=n.replace(t+",","");
    $("#groups_ids").val(n)
}
