; input 4line, save to csv

; -- known issues
; if file is already open, save alt-file 
; fails to run twice on same instance; 'empty' or destroy vars or gui?

f3::
; create gui

Gui, Add, Text,, line 1:
Gui, Add, Text,, line 2:
Gui, Add, Text,, line 3:
Gui, Add, Text,, line 4:
Gui, Add, Edit, vLineOne ym  ; The ym option starts a new column of controls.
Gui, Add, Edit, vLineTwo
Gui, Add, Edit, vLineThree
Gui, Add, Edit, vLineFour
Gui, Add, Button, default, OK  ; The label ButtonOK runs on button_press (below).

; show gui
Gui, Show,, Recipe Input
return ;   

; define (and do) buttonclick
GuiClose:
ButtonOK:
Gui, Submit  ; Save GUI vars.


; --filework--

; set wd and vars
; SetWorkingDir, G:\Dropbox\work\library\push
SetWorkingDir, C:\Users\Owner\Dropbox\work\library\push
FormatTime, TimeString, T8, yyyy-MM-dd-hhmm

varFilename = %A_WorkingDir%\inbox.csv
varInit = text`,datetime`,line`n
varRecipeInput = %LineOne%`,%TimeString%`,1`n%LineTwo%`,%TimeString%`,2`n%LineThree%`,%TimeString%`,3`n%LineFour%`,%TimeString%`,4`n

; make file
if !FileExist(varFilename)
	FileAppend, %varInit%, %varFilename% 

; append line
FileAppend, %varRecipeInput%, %varFilename% 

Return

; --example--
; cloth-sew-alt
; fittings-permanent-vs-stitch
; join-fibers-two at point
; e-from-amazon-glue

