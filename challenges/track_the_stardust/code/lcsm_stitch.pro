pro LCSM_stitch
; M.Greenberg Adapted from:
; Program stitches together images from .tif stacks of known
; translation. Requires .lsm files to be converted to .tif
; before use

;inputted Conditions
slices = 119
xres = 2048
yres = 2048
orig_arr = readtiffstack('D:\MGreenberg\*')
add_arr = readtiffstack('D:\MGreenberg\*')
del_x = 400
del_y = 400

result_x = (2*xres)-del_x
result_y = (2*yres)-del_y
result_arr = intarr(result_x)(result_y)

;variables used in code
tot =0L
grandTot = 0L
totArr = intarr(xres)
Index = indgen(xres)

; 2 For loops
for i=0,  slices DO BEGIN
	for j=0, result_x DO BEGIN
		for k=0, result_y DO BEGIN
			IF ((xres-del_x) LT i AND i LT 2048 AND (yres-del_y) LT j AND j LT 2048) THEN BEGIN
				result_arr[i,j] = (add_arr[i,j] + orig_arr[del_x-(2048-i),del_y-(2048-j)])/2
			ENDIF ELSE BEGIN

			ENDELSE
		ENDFOR
	ENDFOR
ENDFOR

print, grandTot		;Prints grand total of voxels

;Plots profile of track
PLOT, Index, totarr, $
TITLE='Track Area vs distance', XTITLE='Distance', $
YTITLE='Cross-sectional Area'
END