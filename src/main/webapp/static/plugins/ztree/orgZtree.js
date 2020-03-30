var setting = {
		view: {
			dblClickExpand: false,
			selectedMulti: false
		},
		data: {
			key : {
				name : "organizationName"
			},
			simpleData: {
				enable : true,
				idKey : "organizationId",
				pIdKey : "parent",
				rootPId : null
			}
		},
		callback: {
			beforeClick: beforeClick,
			onClick: onClick
		}
	};

	function beforeClick(treeId, treeNode) {
//		var check = (treeNode && treeNode.organizationType=='3364');
//		if (!check) alert("只能选门店...");
//		return check;
		return true;
	}
	
	function onClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("orgTree"),
		nodes = zTree.getSelectedNodes(),
		name = "";
		id = "";
		nodes.sort(function compare(a,b){return a.id-b.id;});
		for (var i=0, l=nodes.length; i<l; i++) {
			name += nodes[i].organizationName + ",";
			id += nodes[i].organizationId + ",";
		}
		if (name.length > 0 ) name = name.substring(0, name.length-1);
		if (id.length > 0 ) id = id.substring(0, id.length-1);
		var orgObj = $("#orgSel");
		var orgIdObj = $("#orgIdSel");
		orgObj.attr("value", name);
		orgIdObj.attr("value", id);
		hideMenu();
	}

	function showMenu() {
		var cityObj = $("#orgSel");
		var cityOffset = $("#orgSel").offset();
		$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

		$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#menuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
			hideMenu();
		}
	}
	
	var zNodes;
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : "orgqueryOrgs_Ajax.action",
			success : function(data, textStatus) {
				zNodes = eval(data);
				$.fn.zTree.init($("#orgTree"), setting, zNodes);
				var treeObj = $.fn.zTree.getZTreeObj("orgTree");
				treeObj.expandAll(true);
			}
		});
	});