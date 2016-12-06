# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\tomh\.spyder2\.temp.py
"""

import cv2

wKey  = 0
fps   = 15
imgCounter = 0;
wName = "Stereo Images"
cv2.namedWindow( wName )

cam1 = cv2.VideoCapture( 1 )
cam2 = cv2.VideoCapture( 0 )

while wKey != 27: # wKey == 27 -> Esc

    ( suc1, tmp_img ) = cam1.read()
    img1 = cv2.flip(tmp_img, int(0))


    ( suc2, tmp_img ) = cam2.read()
    img2 = cv2.flip(tmp_img, int(0))
    img2 = tmp_img

    I = cv2.hconcat( [img1 , img2] )
    cv2.imshow( wName, I )
    wKey = cv2.waitKey( 1000/fps )
    
    if wKey == 32: # wKey == 32 -> Space
        i1Name = "cam1-" + str(imgCounter) + ".tif"
        i2Name = "cam2-" + str(imgCounter) + ".tif"
        cv2.imwrite( i1Name, cv2.cvtColor( img1, cv2.COLOR_BGR2GRAY ) )
        cv2.imwrite( i2Name, cv2.cvtColor( img2, cv2.COLOR_BGR2GRAY ) )
        imgCounter = imgCounter + 1
        print "=================================================="
        print "Image saved:"
        print "    ", i1Name
        print "    ", i2Name

cam1.release
cam2.release
cv2.destroyAllWindows()