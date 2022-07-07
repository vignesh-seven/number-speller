#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

F3::
;currentClipboard = %Clipboard%

clipboard =  
Send, ^c
ClipWait
myNumber = %Clipboard%

;Clipboard = %currentClipboard

numberToWords(myNumber)
Return

; Functions

numberToWords(myNumber) {
  myNumber := Trim(myNumber, OmitChars := "  `t`r`n.,()/-")
  myNumberInWords := ""
  ; currentPlace := 1
  ; numberLength := StrLen(myNumber)

  ; digits := StrSplit(myNumber)

  ; MsgBox % digits

  
  ; ten := (StrLen(digits) - 1) . (StrLen(digits))
  hundred := SubStr(myNumber, -2, 1)
  thousand := SubStr(myNumber, -4, 2)
  lakh := SubStr(myNumber, -6, 2)
  ;if (SubStr(myNumber, -8, 2) = SubStr(myNumber, -8, 1)) {

  ;}

  if ((StrLen(myNumber) <= 10) AND (StrLen(myNumber) >= 8)) {
    switch StrLen(myNumber) {
      case 8: crore := SubStr(myNumber, -9, 1)
      case 9: crore := SubStr(myNumber, -9, 2)
      case 10: crore := SubStr(myNumber, -9, 3)
    }  
    myNumberInWords := myNumberInWords . toWords(crore) . "Crore "
  }

  if ((toWords(lakh)) AND (StrLen(myNumber) >= 6)) {
    switch StrLen(myNumber) {
      case 6: lakh := SubStr(myNumber, -7, 1)
      case 7: lakh := SubStr(myNumber, -7, 2)
    }  
    myNumberInWords := myNumberInWords . toWords(lakh) . "Lakh "
  }

  if ((toWords(thousand)) AND (StrLen(myNumber) >= 4)) {
    switch StrLen(myNumber) {
      case 4: thousand := SubStr(myNumber, -5, 1)
      case 5: thousand := SubStr(myNumber, -5, 2)
    }  
    myNumberInWords := myNumberInWords . toWords(thousand) . "Thousand "
  }
  
  if ((toWords(hundred)) AND (StrLen(myNumber) >= 3)) {
    switch StrLen(myNumber) {
      case 3: hundred := SubStr(myNumber, -2, 1)
    }  
    myNumberInWords := myNumberInWords . toWords(hundred) . "Hundred "
  }

  ten := SubStr(myNumber, -1, 2)

  myNumberInWords := myNumberInWords . toWords(ten)
  ; Msgbox % doubleDigitWord(currentNumber)

  ; MsgBox % "Ten: " . ten "; Hund: " . hundred . "; Thousand: " . thousand . "; Lakh: " . lakh . "; Crore: " . crore

  Send % myNumberInWords

}

toWords(num) {
  theWord := ""
  tens := SubStr(num, 1, 1)
  ones := SubStr(num, 2, 1)
  if (StrLen(num) = 1) {
    ones := SubStr(num, 1, 1)
    tens := ""
  }

  ;MsgBox % "m: " . num . "    Ones: " . ones . "    Tens: " . tens
  switch tens {
    case "1": {
      switch ones {
        case "1": {
          theWord := theWord . "Eleven "
          Return theWord
        }
        case "2": {
          theWord := theWord . "Twelve "
          Return theWord
        }
        case "3": {
          theWord := theWord . "Thirteen "
          Return theWord
        }
        case "4": {
          theWord := theWord . "Fourteen "
          Return theWord
        }
        case "5": {
          theWord := theWord . "Fifteen "
          Return theWord
        }
        case "6": {
          theWord := theWord . "Sixteen "
          Return theWord
        }
        case "7": {
          theWord := theWord . "Seventeen "
          Return theWord
        }
        case "8": {
          theWord := theWord . "Eighteen "
          Return theWord
        }
        case "9": {
          theWord := theWord . "Nineteen "
          Return theWord
        }
      }
    }
    case "2": theWord := "Twenty "
    case "3": theWord := "Thirty "
    case "4": theWord := "Forty "
    case "5": theWord := "Fifty "
    case "6": theWord := "Sixty "
    case "7": theWord := "Seventy "
    case "8": theWord := "Eighty "
    case "9": theWord := "Ninety "
    case "0": theWord := ""
    case "": theWord := ""
  }
  switch ones {
    case "1": theWord := theWord . "One "
    case "2": theWord := theWord . "Two "
    case "3": theWord := theWord . "Three "
    case "4": theWord := theWord . "Four "
    case "5": theWord := theWord . "Five "
    case "6": theWord := theWord . "Six "
    case "7": theWord := theWord . "Seven "
    case "8": theWord := theWord . "Eight "
    case "9": theWord := theWord . "Nine "
    case "0": theWord := theWord . ""
    case "": theWord := theWord . ""
  }
  Return theWord
}



; Extra keys
F1::
Reload, Toggle
Return

+F1::
ExitApp, 0
Return