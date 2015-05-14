Feature: contact an MFR

  As a app user
  So that I can be helped in case of an emergency
  I want to be able to contact an MFR

Background: database status

  Given the following MFRs exist:
  | username     | password | name          | rollno   | phoneno     | gender |
  | usaidm    	 | usaidm   | Usaid Mandvia | 16100215 | 03331310724 | Male   |
  | aminas       | aminas   | Amina Saeed   | 15110032 | 03216548927 | Female |
  | rashidm      | rashidm  | Rashid Minhas | 17100020 | 03455487851 | Male   |
  | areebat      | areebat  | Areeba Tayyab | 16100222 | 03154585269 | Female |
  
  And the following Users exist:
  | username | password | rollno   | phoneno     | gender |
  | hammadm  | hammadm  | 16100032 | 03322485721 | Male   |
  | alinam	 | alinam   | 16110568 | 03132545682 | Female |
  
  And the following Locations exist:
  | mfr_id | gps_latitude | gps_longitude | location |
  |	1	   | 31.470855    | 74.412103     | M-6      |
  | 2	   | 31.380445	  | 74.412103	  | SSE	     |
  
  And the following Kits exist:
  | location  | details 						| available |
  | SSE       | First Floor Lobby	  			| yes		|
  | SportsCom | EMS Room            			| no        |
  | Rec Room  | PDC stall						| yes		|

Scenario: get nearest MFR
	Given I am on the login page
	And I login as User "hammadm"
  Then I am on the details page for "hammadm"
	And my GPS coordinates are "31.470855", "73.412103"
	When I press "Get Help"
	Then I should see  "Usaid Mandvia"

