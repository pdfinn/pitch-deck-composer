-- Prompt the user to select the Keynote file
set keynoteFile to choose file with prompt "Please select the Keynote file:" without invisibles

-- Prompt the user to select the tags
set tagList to {"English", "Esperanto", "Confidential", "Investor", "Sales"}
set selectedTags to choose from list tagList with title "Select Tags to Include" with prompt "Please choose the tags you want to include in the deck:" with multiple selections allowed

-- Check if the user made a selection
if selectedTags is false then
	display dialog "No tags were selected. The script will now exit." buttons {"OK"} default button 1
else
	-- Prompt the user to specify the output PDF file
	set pdfFile to choose file name with prompt "Save the exported PDF as:" default name "Exported_Presentation.pdf"
	
	-- Open the Keynote file
	tell application "Keynote"
		open keynoteFile
		
		set theDocument to front document
		set allSlides to every slide of theDocument
		
		-- Store the initial visibility state of each slide
		set originalSlideStates to {}
		repeat with aSlide in allSlides
			set end of originalSlideStates to skipped of aSlide
		end repeat
		
		-- Loop through all slides and set their visibility based on the selected tags
		repeat with aSlide in allSlides
			set slideNotes to presenter notes of aSlide
			set slideVisible to false
			
			repeat with tag in selectedTags
				if slideNotes contains "#" & tag then
					set slideVisible to true
					exit repeat
				end if
			end repeat
			
			set skipped of aSlide to not slideVisible
		end repeat
		
		-- Export the presentation as a PDF
		export theDocument to pdfFile as PDF
		
		-- Restore the original visibility state of each slide
		repeat with i from 1 to count allSlides
			set skipped of item i of allSlides to item i of originalSlideStates
		end repeat
		
		-- Close the Keynote file
		close theDocument
	end tell
end if
