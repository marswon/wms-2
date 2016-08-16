<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="/commons/taglib.jsp"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title><delmar:message key="crmstastics.title" /></title>

<link rel="Stylesheet" href="../css/displaytag.css" type="text/css" />
<link rel="stylesheet" href="../css/style.css" type="text/css" media="all"/>
<link rel="stylesheet" href="../css/delmar.css" type="text/css" media="all"/>

<script type='text/javascript' src='../js/dm/delmar.js'></script>
<script type='text/javascript' src='../js/ea.effect.js'></script>
<script type='text/javascript' src='../js/ea.validate.js'></script>


<script type="text/javascript" src="../js/jquery/jquery-1.11.1.min.js"/></script>
<script type="text/javascript" src="../js/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"/></script>
<script type="text/javascript" src="../js/jquery/jquery-ui-1.11.4.custom/i18n/datepicker-<s:property value='#session.currentlanguageoriginal'/>.js"/></script>

<link rel="Stylesheet" href="../js/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css" type="text/css" />
<link rel="Stylesheet" href="../js/jquery/jquery-ui-1.11.4.custom/jquery-ui.theme.min.css" type="text/css" />

<script type="text/javascript" src="../js/jquery/plugin/multiselect/src/jquery.multiselect.js"></script>
<link rel="Stylesheet" href="../js/jquery/plugin/multiselect/jquery.multiselect.css" type="text/css" />
<script type="text/javascript" src="../js/jquery/plugin/multiselect/i18n/jquery.multiselect.<s:property value='#session.currentlanguagelowercase'/>.js"></script>

<link href="../js/jquery/plugin/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<SCRIPT  type="text/javascript" src="../js/jquery/plugin/ligerUI/js/ligerui.min.js"></SCRIPT>



<script type='text/javascript' src='../dwr/engine.js'></script>



<style type="text/css">

.table tbody tr {
   vertical-align:text-top;
}



</style>



<script type="text/javascript">
function validateFilter()
{
	
	var createDateBegin=document.getElementById("createDateBegin");
	if(isEmpty(createDateBegin.value))
		{
			alert('<delmar:warn errorKey="errors.required" key="buscustomer.column.created"/>');
			return false;
		}

	var createDateEnd=document.getElementById("createDateEnd");
	if(isEmpty(createDateEnd.value))
		{
			alert('<delmar:warn errorKey="errors.required" key="buscustomer.column.created"/>');
			return false;
		}

		
	return true;	
	
}


$(document).ready(function() {	
	  $("#btnQuery").click(function(event)
	 		 {
		        if (document.all.userOrgs)
		        {
		        	$("#orgIds").val($("#userOrgs").val());		        	
		        }	   	
		        var waitingdialog=showWaiting("<delmar:message key='public.dialg.waitingsearch' cn='数据正在进行查询，请稍后'/>",false);
		        
		        //if(validateFilter()==false);
		        //{
    		    //    waitingdialog.close();
    		    //    return false;
		        //}
		        
		        return true;		        
	
	 		 });	
	  
	  

	 
    	jQuery('#createDateBegin').datepicker({changeMonth: true,changeYear: true,showOn: "button",
    		dateFormat:"yy-mm-dd",    		
            buttonImage: "../images/DatePicker.GIF",
            buttonImageOnly: true,
            buttonText: "Select date",
            numberOfMonths:2,
            onClose:function(selectedDate) {
               $("#createDateEnd").datepicker("option","minDate",selectedDate);	
            }
    	    });
    	
    	jQuery('#createDateEnd').datepicker({changeMonth: true,changeYear: true,showOn: "button",
    		dateFormat:"yy-mm-dd",
            buttonImage: "../images/DatePicker.GIF",
            buttonImageOnly: true,
            buttonText: "Select date",
            numberOfMonths:2,            
            onClose:function(selectedDate) {
                $("#createDateBegin").datepicker("option","maxDate",selectedDate);	
             }
     	    });
    	

      
 		if (document.all.userOrgs)
		{
	    	jQuery("#userOrgs").multiselect(
	    	    	{
	    	    		initValue:$("#orgIds").val(),
	    	    		minWidth:180
	    	    	});
	    	    	
	    	      	
	 	    	var varray=$("#orgIds").val().split(",");
	 	    	for (var i in varray)
	 	    	{
	 	          $("#userOrgs").find("option[value='"+varray[i]+"']").attr("selected",true);
	 	    	}
		}	
    	      
      

       
	});
	
	
	



 

 
</script>
</head>

<body >


<s:form action="crmstastics_list" namespace="/crm"  theme="simple" >
<div style="margin:5px">

<table border="0" cellpadding="0" cellspacing="0" class="cTableBorder">
        <tr> 
          <td align="left" class="navig"><delmar:message key="crmstastics.location" /></td>
          <td class="navig" align="right"></td>
        </tr>
 </table>

 <div id="filterpage">
        <div class="d-filterheader">
            <div id="filterpageheader" style="cursor:pointer; width:90%">
                <img id="filterpagetoggleimage" class="toggle" alt="toggler"
                     src="../images/core/icon_expand_l.gif"/>
                <delmar:message key="public.list.filter"/>
            </div>
        </div>
        
        <div id="filterForm" class="d-hidden">
            <s:hidden id="queryStatus" value="%{#session.MAP_KEY_OF_SESSION.queryStatus}"/>
			<table border="0" cellpadding="0" cellspacing="0"  class="d-filterTable" style="padding-top:5px;padding-bottom:5px">
		       <tr>
                  <td class="d-tdlabel"> 	
			       	<delmar:message key="public.column.created" />
			      </td>
			      <td class="d-tdinput" > 				       	
			   		<s:textfield  id="createDateBegin"  readonly="true"  name="createDateBegin" value="%{#session.MAP_KEY_OF_SESSION.createDateBegin}" ></s:textfield>
			   		<delmar:message key="public.column.to" />
			        <s:textfield  id="createDateEnd"  readonly="true"  name="createDateEnd" value="%{#session.MAP_KEY_OF_SESSION.createDateEnd}" ></s:textfield>   		
			       </td>
			       
			        <td class="d-tdinput">
			              <c:if test="${MAP_KEY_OF_SESSION.orgVisible=='true'}"> 	
					      <s:checkbox name="orgGroup" id="orgGroup" fieldValue="yes" />
					      <delmar:message key="crmstatics.column.orggroup" />
					      </c:if> 			       	
			              <c:if test="${MAP_KEY_OF_SESSION.orgVisible!='false'}">					       
					      <s:checkbox name="userGroup" id="userGroup" fieldValue="yes"   />
					      <delmar:message key="crmstatics.column.usergroup" />
					      </c:if>
  				           <s:checkbox name="monthGroup" id="monthGroup" fieldValue="yes"  value="%{#session.MAP_KEY_OF_SESSION.monthGroup}" />
					      <delmar:message key="crmstatics.column.monthgroup" />
					       			       	
			        </td>
			       
			     
			    <td class="d-tdlabel"> 	
		       	<!--To check whether the user have the group privilege  -->
		       	<c:if test="${MAP_KEY_OF_SESSION.orgVisible=='true'}">
		    	<delmar:message key="customer.column.org" />
		    	</c:if>
		       </td>
		      <td class="d-tdinput" > 
		       
		       
		        <c:if test="${MAP_KEY_OF_SESSION.orgVisible=='true'}">
			    	<s:select list="userOrgAccessList" listKey="id" listValue="name"  name="userOrgs"  multiple="true"   id="userOrgs"  cssClass="d-searchtext"></s:select>
			    	<br>
			    	<s:textfield name="userName" id="userName" value="%{#session.MAP_KEY_OF_SESSION.userName}" cssClass="d-searchtext"  title="%{#session.resource.get('customer.inputtitle.username')}"></s:textfield>
		       	</c:if>
		       	
		        <c:if test="${MAP_KEY_OF_SESSION.orgVisible=='org'}">
			    	<delmar:message key="public.accessprivilege.org"/>
		       	</c:if>
		       	
		        <c:if test="${MAP_KEY_OF_SESSION.orgVisible=='group'}">
			    	<delmar:message key="public.accessprivilege.usergroup"/>
			    	<s:checkbox name="beGroup" id="beGroup" fieldValue="true" value="%{#session.MAP_KEY_OF_SESSION.beGroup}" />
			    	<s:textfield name="userName" id="userName"  value="%{#session.MAP_KEY_OF_SESSION.userName}" cssClass="d-searchtext"  title="%{#session.resource.get('customer.inputtitle.username')}"></s:textfield>	
		       	</c:if>		       	
		       			       	
		       	<s:hidden name="orgIds" id="orgIds" value="%{#session.MAP_KEY_OF_SESSION.orgIds}"></s:hidden>
		      </td>						      
		      
 
			      </tr>
			              
			       <tr>
			       <td colspan=5  class="d-searchbutton">     
			       <s:submit method="search" cssClass="input_submit" id="btnQuery" value="%{#session.resource.get('common.button.search')}" ></s:submit>
                   <s:reset cssClass="input_submit" id="btnReset" value="%{#session.resource.get('common.button.reset')}" ></s:reset>			       
			       </td>    
			       </tr>
			       </table>        
        </div>

 </div>
    


<!-- <c:out value="${buttons}" escapeXml="false"/> -->
 <div id="cusdiv">
 <div id="cusdivtitle" style="margin-bottom:10px;text-align:center"><delmar:message key="crmstastics.customerdata"/></div>
 <display:table name="sessionScope.MAP_KEY_OF_SESSION.stasticscusList" cellspacing="0" cellpadding="0"  requestURI=""
		    id="customerlist"  class="table" export="true">
		<display:column  titleKey="common.label.sequence" media="html csv excel xml pdf rtf">
			   <c:out value="${customerlist_rowNum}"/>
    	</display:column>
    	
	    <c:if test="${customerlist.groupList[0]!=null}">
	   	<display:column escapeXml="true"  titleKey="buscustomer.column.group1"  sortable="true" >
	          <c:out value="${customerlist.groupList[0]}"/>
	   	</display:column>
	    </c:if>>
	    
	    <c:if test="${customerlist.groupList[1]!=null}">
	   	<display:column escapeXml="true"  titleKey="buscustomer.column.group2"  sortable="true" >
	          <c:out value="${customerlist.groupList[1]}"/>
	   	</display:column>
	    </c:if>    
	    <display:column property="count"  escapeXml="true"  titleKey="crmstastics.column.count" sortable="true"></display:column>	
	</display:table>
</div>


<br>
 <div id="mandiv" style="clear:both">
 <div id="mandivtitle" style="margin-bottom:10px;text-align:center"><delmar:message key="crmstastics.linkmandata"/></div>

 <display:table name="sessionScope.MAP_KEY_OF_SESSION.stasticsmanList" cellspacing="0" cellpadding="0"  requestURI=""
		    id="linkmanlist"class="table" export="true">
		<display:column  titleKey="common.label.sequence" media="html csv excel xml pdf rtf">
			   <c:out value="${linkmanlist_rowNum}"/>
    	</display:column>
    	
	    <c:if test="${linkmanlist.groupList[0]!=null}">
	   	<display:column escapeXml="true"  titleKey="buscustomer.column.group1"  sortable="true" >
	          <c:out value="${linkmanlist.groupList[0]}"/>
	   	</display:column>
	    </c:if>>
	    
	    <c:if test="${linkmanlist.groupList[1]!=null}">
	   	<display:column escapeXml="true"  titleKey="buscustomer.column.group2"  sortable="true" >
	          <c:out value="${linkmanlist.groupList[1]}"/>
	   	</display:column>
	    </c:if>    
	    <display:column property="count"  escapeXml="true"  titleKey="crmstastics.column.count" sortable="true"></display:column>	
	</display:table>
</div>


<br>
 <div id="recdiv"  style="clear:both">
 <div id="recdivtitle" style="margin-bottom:10px;text-align:center"><delmar:message key="crmstastics.linkrecorddata"/></div>

 <display:table name="sessionScope.MAP_KEY_OF_SESSION.stasticsrecList" cellspacing="0" cellpadding="0"  requestURI=""
		    id="linkrecordlist" class="table" export="true">
		<display:column  titleKey="common.label.sequence" media="html csv excel xml pdf rtf">
			   <c:out value="${linkrecordlist_rowNum}"/>
    	</display:column>
    	
	    <c:if test="${linkrecordlist.groupList[0]!=null}">
	   	<display:column escapeXml="true"  titleKey="buscustomer.column.group1"  sortable="true" >
	          <c:out value="${linkrecordlist.groupList[0]}"/>
	   	</display:column>
	    </c:if>>
	    
	    <c:if test="${linkrecordlist.groupList[1]!=null}">
	   	<display:column escapeXml="true"  titleKey="buscustomer.column.group2"  sortable="true" >
	          <c:out value="${linkrecordlist.groupList[1]}"/>
	   	</display:column>
	    </c:if>    
	    <display:column property="count"  escapeXml="true"  titleKey="crmstastics.column.count" sortable="true"></display:column>	
	</display:table>
</div>
</div>

</s:form>







<script type="text/javascript">


$(document).ready(function() {

    
      
    if ("<delmar:session key='userGroup'/>"=="yes")
    {
   	 $("#userGroup").attr("checked","true");
    }
      
    if ("<delmar:session key='orgGroup'/>"=="yes")
    {
   	 $("#orgGroup").attr("checked","true");
    }

    if ("<delmar:session key='monthGroup'/>"=="yes")
    {
   	 $("#monthGroup").attr("checked","true");
    }
    

});  



    highlightTableRows("customerlist");
    highlightTableRows("linkmanlist");
    highlightTableRows("linkrecordlist");
    

    if ($('#filterpageheader')) {
        if (typeof(Event) == "undefined") {
        } else {
        	$('#filterpageheader').bind('click', function() {
                $('#filterForm').toggle();
                if ($('#filterForm').hasClass("d-visible")) {
                	$('#filterForm').removeClass("d-visible");
                	$('#filterForm').addClass("d-hidden");
                    $('#filterpagetoggleimage').attr('src','../images/core/icon_collapse_l.gif');
                } else {
                	$('#filterForm').removeClass("d-hidden");
                	$('#filterForm').addClass("d-visible");
                    $('#filterpagetoggleimage').attr('src','../images/core/icon_expand_l.gif');
                }
            }) ;
        }
    }
    
    if ($("#queryStatus").val()=="true")  
    {
    	$('#filterForm').removeClass("d-hidden");
    	$('#filterForm').addClass("d-visible");
        $('#filterpagetoggleimage').attr('src','../images/core/icon_expand_l.gif');
    }
    
    
    

        
   
    
</script>

</body>
</html>
