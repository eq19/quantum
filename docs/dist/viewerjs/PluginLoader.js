function loadPlugin(e,n){"use strict";var i;i=document.createElement("script"),i.async=!1,i.onload=n,i.src=e+".js",i.type="text/javascript",document.getElementsByTagName("head")[0].appendChild(i)}function loadDocument(e){"use strict";if(e){var n,i=e.split(".").pop();switch(i=i.toLowerCase()){case"odt":case"odp":case"ods":case"fodt":loadPlugin("./ODFViewerPlugin",function(){n=ODFViewerPlugin});break;case"pdf":loadPlugin("./PDFViewerPlugin",function(){n=PDFViewerPlugin})}window.onload=function(){n&&(viewer=new Viewer(new n))}}}var viewer;