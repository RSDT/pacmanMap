var controls;
var img = {	
			blinky:{
				up:{
					open:"img/blinky/ghost-32x32.png",
					closed:"img/blinky/ghost-32x32.png",
					powerup:{
						open:"img/blinky/ghost-32x32.png",
						closed:"img/blinky/ghost-32x32.png"
					}
					},
				right:{
					open:"img/blinky/ghost-32x32.png",
					closed:"img/blinky/ghost-32x32.png",
					powerup:{
						open:"img/blinky/ghost-32x32.png",
						closed:"img/blinky/ghost-32x32.png"
					}
				},
				down:{
					open:"img/blinky/ghost-32x32.png",
					closed:"img/blinky/ghost-32x32.png",
					powerup:{
						open:"img/blinky/ghost-32x32.png",
						closed:"img/blinky/ghost-32x32.png"
					}
				},
				left:{
					open:"img/blinky/ghost-32x32.png",
					closed:"img/blinky/ghost-32x32.png",
					powerup:{
						open:"img/blinky/ghost-32x32.png",
						closed:"img/blinky/ghost-32x32.png"
					}
				},
			}
			clyde:{
				up:{
					open:"img/clyde/ghost-32x32.png",
					closed:"img/clyde/ghost-32x32.png",
					powerup:{
						open:"img/clyde/ghost-32x32.png",
						closed:"img/clyde/ghost-32x32.png"
					}
					},
				right:{
					open:"img/clyde/ghost-32x32.png",
					closed:"img/clyde/ghost-32x32.png",
					powerup:{
						open:"img/clyde/ghost-32x32.png",
						closed:"img/clyde/ghost-32x32.png"
					}
				},
				down:{
					open:"img/clyde/ghost-32x32.png",
					closed:"img/clyde/ghost-32x32.png",
					powerup:{
						open:"img/clyde/ghost-32x32.png",
						closed:"img/clyde/ghost-32x32.png"
					}
				},
				left:{
					open:"img/clyde/ghost-32x32.png",
					closed:"img/clyde/ghost-32x32.png",
					powerup:{
						open:"img/clyde/ghost-32x32.png",
						closed:"img/clyde/ghost-32x32.png"
					}
				},
			}, 
			inky:{
				up:{
					open:"img/inky/ghost-32x32.png",
					closed:"img/inky/ghost-32x32.png",
					powerup:{
						open:"img/pacman/ghost-32x32.png",
						closed:"img/pacman/ghost-32x32.png"
					}
					},
				right:{
					open:"img/inky/ghost-32x32.png",
					closed:"img/inky/ghost-32x32.png",
					powerup:{
						open:"img/pacman/ghost-32x32.png",
						closed:"img/pacman/ghost-32x32.png"
					}
				},
				down:{
					open:"img/inky/ghost-32x32.png",
					closed:"img/inky/ghost-32x32.png",
					powerup:{
						open:"img/pacman/ghost-32x32.png",
						closed:"img/pacman/ghost-32x32.png"
					}
				},
				left:{
					open:"img/inky/ghost-32x32.png",
					closed:"img/inky/ghost-32x32.png",
					powerup:{
						open:"img/pacman/ghost-32x32.png",
						closed:"img/pacman/ghost-32x32.png"
					}
				},
			},
			pinky:{
				up:{
					open:"img/pinky/ghost-32x32.png",
					closed:"img/pinky/ghost-32x32.png",
					powerup:{
						open:"img/pinky/ghost-32x32.png",
						closed:"img/pinky/ghost-32x32.png"
					}
					},
				right:{
					open:"img/pinky/ghost-32x32.png",
					closed:"img/pinky/ghost-32x32.png",
					powerup:{
						open:"img/pinky/ghost-32x32.png",
						closed:"img/pinky/ghost-32x32.png"
					}
				},
				down:{
					open:"img/pinky/ghost-32x32.png",
					closed:"img/pinky/ghost-32x32.png",
					powerup:{
						open:"img/pinky/ghost-32x32.png",
						closed:"img/pinky/ghost-32x32.png"
					}
				},
				left:{
					open:"img/pinky/ghost-32x32.png",
					closed:"img/pinky/ghost-32x32.png",
					powerup:{
						open:"img/pinky/ghost-32x32.png",
						closed:"img/pinky/ghost-32x32.png"
					}
				},
			},
			pacman:{ //todo Waarom heet het bestand pacman ghost????????
				up:{
					open:"img/pacman/ghost-32x32.png",
					closed:"img/pacman/ghost-32x32.png"
					},
				right:{
					open:"img/pacman/ghost-32x32.png",
					closed:"img/pacman/ghost-32x32.png"
				},
				down:{
					open:"img/pacman/ghost-32x32.png",
					closed:"img/pacman/ghost-32x32.png",
					powerup:{
						open:"img/pacman/ghost-32x32.png",
						closed:"img/pacman/ghost-32x32.png"
					}
				},
				left:{
					open:"img/pacman/ghost-32x32.png",
					closed:"img/pacman/ghost-32x32.png"
					powerup:{
						open:"img/pacman/ghost-32x32.png",
						closed:"img/pacman/ghost-32x32.png"
					}
				}
			},
			powerup:"img/powerup/powerup-32x32.png"
		};
var player = {
				pacman: "players/pacman",
				blinky:	"players/blinky",
				clyde:	"players/clyde",
				inky:	"players/inky",
				pinky:	"players/pinky",
			};
function createMap(){
	var center = { lat:	52.006808, 	lng:6.022500}; //-- Midden in het speel gebied.
	map = new google.maps.Map(document.getElementById('map'),
		{	
			zoom :	18,
			center: center
		});
	var kml = new google.maps.KmlLayer({
			url: 'http://jotihunt2017.area348.nl/RealLivePacMan.kml',
			map: map,
			preserveViewport: true,
			clickable: false
		});
}

function createFireBaseDatabase(){
	firebase.initializeApp(firebaseconfig);
	var database = firebase.database;
	database.reference = database.ref;
	return firebase.database();
}

function Player(name){
	if (name != "pacman" || name != "blinky"|| name != "clyde" || name != "pinky" || name != "inky"){
		throw "name is not a players name";	
	}
	this.marker = new google.maps.Marker({
			position: pacPosition,	
			map: map,			
			icon: new google.maps.MarkerImage(img[name]["right"]["open"],null,null,new google.maps.Point(16,16))		
		});
	this.direction = "right";
	this.open = true;
	this.powerup = false;
	this.animation = null;
	this.updateImg= function(){
		var playerimg;
		var imgloc;
		if (this.powerup){
			imgloc = img[name][direction]["powerup"];
		}  else{
			imgloc = img[name][direction];
		}
		if (this.open){
			playerimg = imgloc["open"];
		}else{
			playerimg = imgloc["closed"];
		}
		var playerIcon = new google.maps.MarkerImage(playerimg,null,null,new google.maps.Point(16,16));
		marker.setIcon(playerIcon);
		this.open = !this.open;
	}
	
	this.startAnimation=function(interval){
		this.animation= setInterval(this.updateImg, speed)
	}
	
	this.stopAnimation=function() {
		clearInterval(this.animation);
		this.animation = null;
	}
	this.setPowerUp = function(powerup){
		this.powerup=powerup;
	}
	this.setLocation= function(lat, lon){
		var latlon = { lat:	lat, lng: lon};
		this.marker.setLocation(latlon);
	}
}
class ControlCenter{
	constructor(map){
		this.map  = map ;
		controls = this;
		this.menu = document.createElement('div');
		this.menu.index = 1;
		this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(this.menu);
		this.menu.hidden=true;
		this.childeren = [] ;
		this.submenu_start = 0;
		this.submenu_end = 0;
		this.submenu = document.createElement('div');
		this.submenu.index = 1;
		this.menu.appendChild(this.createButton('Verberg controls', '#fff', function(div){
					
  					controls.menu.hidden = !controls.menu.hidden;
  					controls.showControls.hidden = !controls.showControls.hidden;
  					window.removeEventListener('resize',controls.showSubMenu) ;
  				}) );
		this.menu.appendChild(this.createButton('vorige', '#fff',function(div){
			if(controls.submenu_start == 0){
				controls.submenu_start = controls.childeren.length - 1 ;
			}
			controls.submenu_end = controls.submenu_start ;
			controls.clearMenu() ;

			var last_child_added = controls.childeren[controls.submenu_start] ;
			controls.submenu_end++ ;
			controls.submenu.appendChild(last_child_added) ;

			while (controls.menu.offsetHeight < window.innerHeight && controls.submenu_start > 0){
				var childToAdd = controls.childeren[controls.submenu_start - 1] ;
				controls.submenu.insertBefore(childToAdd, last_child_added) ;
				controls.submenu_start--;
				last_child_added = childToAdd ;
			}
			if (controls.menu.offsetHeight >= window.innerHeight){
				controls.submenu.removeChild(last_child_added) ;
				controls.submenu_start++;
			}
		}));
		this.menu.appendChild(this.submenu);
		this.menu.appendChild(this.createButton('volgende', '#fff',function(div){
			if(controls.submenu_end == controls.childeren.length){
				controls.submenu_end = 0 ;
			}
			controls.submenu_start = controls.submenu_end;
			controls.clearMenu() ;
			var last_child_added = controls.childeren[controls.submenu_end] ;
			controls.submenu_end++ ;
			controls.submenu.appendChild(last_child_added) ;
			while (controls.menu.offsetHeight < window.innerHeight && controls.submenu_end < controls.childeren.length){
				var childToAdd = controls.childeren[controls.submenu_end] ;
				controls.submenu.appendChild(childToAdd) ;
				controls.submenu_end++;
				last_child_added = childToAdd ;
			}
			if (controls.menu.offsetHeight >= window.innerHeight){
				controls.submenu.removeChild(last_child_added) ;
				controls.submenu_end--;
			}
		}));


		var controlText = document.createElement('div');
		controlText.style.color = 'rgb(25,25,25)';
		controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
		controlText.style.fontSize = '16px';
		controlText.style.lineHeight = '28px';
		controlText.style.paddingLeft = '5px';
		controlText.style.paddingRight = '5px';
		controlText.innerHTML = 'controls';

		this.showControls = document.createElement('div');
		this.showControls.index = 1;
		this.showControls.style.backgroundColor = '#fff';
		this.showControls.style.border = '2px solid #fff';
		this.showControls.style.borderRadius = '3px';
		this.showControls.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
		this.showControls.style.cursor = 'pointer';
		this.showControls.style.marginBottom = '22px';
		this.showControls.style.textAlign = 'center';
		this.showControls.appendChild(controlText);
		this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(this.showControls);
		this.showControls.addEventListener('click',function(){
			controls.menu.hidden = !controls.menu.hidden;
			controls.showControls.hidden = !controls.showControls.hidden;
			controls.showSubMenu() ;
			window.addEventListener('resize',controls.showSubMenu) ;
		});

		
	}
	createButton(label, start_kleur, onclick){
		// Set CSS for the control border.
		var controlUI = document.createElement('div');
		controlUI.style.backgroundColor = start_kleur;

		controlUI.style.border = '2px solid #fff';
		controlUI.style.borderRadius = '3px';
		controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
		controlUI.style.cursor = 'pointer';
		controlUI.style.marginBottom = '11px';
		controlUI.style.textAlign = 'center';

		// Set CSS for the control interior.
		var controlText = document.createElement('div');
		controlText.style.color = 'rgb(25,25,25)';
		controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
		controlText.style.fontSize = '16px';
		controlText.style.lineHeight = '38px';
		controlText.style.paddingLeft = '5px';
		controlText.style.paddingRight = '5px';
		controlText.innerHTML = label;
		controlUI.appendChild(controlText);
		controlUI.addEventListener('click', function(){
			var result = onclick(controlUI) ;
			if (result != undefined){
				if (result){
					controlUI.style.backgroundColor = 'rgb(0,255,0)';
				}else{
					controlUI.style.backgroundColor = 'rgb(255,0,0)';
				}
			}
		}) ;
		return controlUI ;
	}
	addButton(label, start_kleur, onclick){
		var controlUI = this.createButton(label, start_kleur, onclick) ;
		this.childeren.push(controlUI) ;
	}
	clearMenu(){
		while(this.submenu.children.length != 0){
			this.submenu.removeChild(this.submenu.children[0])
		}
	}
	showSubMenu(){
		controls.clearMenu() ;
		
		controls.submenu_end = controls.submenu_start ;
		var last_child_added = controls.childeren[controls.submenu_end] ;
		controls.submenu_end++ ;
		controls.submenu.appendChild(last_child_added) ;
		while (controls.menu.offsetHeight < window.innerHeight && controls.submenu_end < controls.childeren.length){
			var childToAdd = controls.childeren[controls.submenu_end] ;
			controls.submenu.appendChild(childToAdd) ;
			controls.submenu_end++;
			last_child_added = childToAdd ;
		}
		if (controls.menu.offsetHeight >= window.innerHeight){
			controls.submenu.removeChild(last_child_added) ;
			controls.submenu_end--;
		}
}
}
