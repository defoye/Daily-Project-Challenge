takeaways:
Make sure the the view hierarchy is set up in the correct order, from backmost to front most. If some views rely on the size of their parents, this is very important. Don't set up views on init, wait to set them up. 

layoutIfNeeded is a handy function that resets the frame of the view.  Useful if there is a reason that you need to know the true width of the view. 

Updated June 13:
Expanded my previous project.  Now the views stretch the width of the bar view, and are properly weighted according to an array of values. 

Updated June 13:
Expanded to have a dynamic layout set by the user. Provides a simple, powerful interface that that only requires a set of values and a set of colors.
