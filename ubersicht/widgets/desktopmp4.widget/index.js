
//# run mp4 on the desktop by @JunesiPhone
command: "",
refreshFrequency: false,
render: function (output){
	return "<video class=\"holder\" style=\"min-width:100%; min-height:100%; object-fit:contain;\" no-controls loop autoplay src=\"./desktopmp4.widget/mp4/walking.mp4\"></video>";
},
style: " \n\
	width:100% \n\
	height: 100% \n\
	background-image:url() \n\
	background-size: cover \n\
	object-fit: contain \n\
	background-color:black \n\
",
update: function (output, domEl) {

}