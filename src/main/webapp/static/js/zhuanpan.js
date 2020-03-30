$('body').height($('body')[0].clientHeight);

var jsonstr={'index':5,'name':'扫地机一台'}; 
	var $hand = $('.animate');
    var data,jd,jjd,hdjp;
   	var awardCount=8;
	$hand.click(function(){
		jd = 360/awardCount/2;
				jjd = 360/awardCount;
			    rotateFunc(jd+(jsonstr.index-1)*jjd,'恭喜你抽中了'+jsonstr.name);
			
			});

var jp = "";
    jp+='<div class="jp"><dl><dt><img src="'+/*写img路径*/'images/z.png'+'"></dt><dd><h4 class="gxzj">'+/*写奖品内容*/'恭喜你获得清风面巾纸一包请到指定网点领取'+'</h4></dd></dl><a href="'+'jpxqz.html'+'"><button class="qr">'+'确定'+'</button></a></div>';



	var rotateFunc = function(angle,text){
		$hand.stopRotate();
		$hand.rotate({
			angle: jd,
			duration:2000,
			animateTo: angle + 1080,
			easing: $hand.linear,
			callback: function(){
				$(".zzc").show();
				$(".sdj").show();
				$(".jp").addClass("animated");
	 			$(".qx").on("click",function(){
	 					$(".zzc").hide();
	 					$(".sdj").show();
	 					
	 			});
	 			$(".qr").on("click",function(){
					$(".zzc").hide();
	 				$(".jp").remove();
	 			});
			}
		});

	};







