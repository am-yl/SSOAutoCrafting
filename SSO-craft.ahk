; Star Stable Online - Craft Automation Script.
; Maintainers: @am-yl and @NebSpacefarer.
; Based on the original work of: @h669835.
; License: GNU General Public License v3.0.
;
; This script might need some personal tweaking depending on your computer and game resolution.
; The default values *should* accommodate a fullscreen game at resolution 1920x1080.
; Please read more at : https://github.com/am-yl/SSOAutoCrafting/blob/main/README.md

; Base position of the first craftable item in workshop.
; Only baseY should be modified.
; Default values: x: 800 , y: 355.
baseX := 800
baseY := 355

; Height of a recipe item, customizable depending on game resolution.
; Default value: 28.
recipeHeight := 28

; Time to wait between each craft.
; Default values : For Normal Workshop = 3000 , For Farah's Workshop = 9000 (longer animation)
craftAnimationTime := 3000

; Waiting time between each script action. For debugging purposes only.
; Default value: 100.
sleepTime := 100

; Dynamic variable for the script, leave untouched.
toggle := false
currentRecipeOffset := recipeHeight

; Main toggle key, allowing to start and stop the script at ease. Default : F9
F9::
toggle := !toggle
if (toggle) {
    SetTimer, CraftLoop, 500
} else {
    SetTimer, CraftLoop, Off
}
return

; /!\ START OF THE SCRIPT
; If you do not know exactly what you are doing,
; leave all of below as is.

; Hotkeys by numbers
F9 & 1::
if (!toggle) {
    currentRecipeOffset := recipeHeight
    ToolTip, Selected: First item
    SetTimer, RemoveTip, -1000
}
return

F9 & 2::
if (!toggle) {
    currentRecipeOffset := recipeHeight * 2
    ToolTip, Selected: Second item
    SetTimer, RemoveTip, -1000
}
return

F9 & 3::
if (!toggle) {
    currentRecipeOffset := recipeHeight * 3
    ToolTip, Selected: Third item
    SetTimer, RemoveTip, -1000
}
return

F9 & 4::
if (!toggle) {
    currentRecipeOffset := recipeHeight * 4
    ToolTip, Selected: Fourth item
    SetTimer, RemoveTip, -1000
}
return

F9 & 5::
if (!toggle) {
    currentRecipeOffset := recipeHeight * 5
    ToolTip, Selected: Fifth item
    SetTimer, RemoveTip, -1000
}
return

F9 & 6::
if (!toggle) {
    currentRecipeOffset := recipeHeight * 6
    ToolTip, Selected: Sixth item
    SetTimer, RemoveTip, -1000
}
return

F9 & 7::
if (!toggle) {
    currentRecipeOffset := recipeHeight * 7
    ToolTip, Selected: Seventh item
    SetTimer, RemoveTip, -1000
}
return

F9 & 8::
if (!toggle) {
    currentRecipeOffset := recipeHeight * 8
    ToolTip, Selected: Eighth item
    SetTimer, RemoveTip, -1000
}
return

F9 & 9::
if (!toggle) {
    currentRecipeOffset := recipeHeight * 9
    ToolTip, Selected: Eighth item
    SetTimer, RemoveTip, -1000
}
return

F9 & 0::
if (!toggle) {
    currentRecipeOffset := recipeHeight * 10
    ToolTip, Selected: Eighth item
    SetTimer, RemoveTip, -1000
}
return

; Remove tooltip
RemoveTip:
ToolTip
return

; Crafting loop
CraftLoop:
    ; Open crafting bench
    Send {e down}
    Sleep, 100
    Send {e up}
    Sleep, 300

    ; Move to selected recipe
    recipeY := baseY + currentRecipeOffset
    MouseMove, baseX, recipeY
    Click down
    Sleep, sleepTime
    Click up
    Sleep, sleepTime

    ; Click 'Yes' button
    MouseMove, 1200, 700 ; Default value: 1200, 700
    Click down
    Sleep, sleepTime
    Click up
    Sleep, craftAnimationTime
    Sleep, sleepTime
return

; --- Optional: Press F4 to exit the script ---
F4::
    ExitApp
return