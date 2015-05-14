Feature: MFR kit availability
		As a MFR 
		So that I can treat patients quickly
		I should be able to see the first aid kits currently available
	
Background: database status

   Given the following MFRs exist:
  | username     | password | name          | rollno   | phoneno     | gender | mfr  |
  | usaidm       | usaidm   | Usaid Mandvia | 16100215 | 03331310724 | Male   | true |
  | aminas       | aminas   | Amina Saeed   | 15110032 | 03216548927 | Female | true |
  | rashidm      | rashidm  | Rashid Minhas | 17100020 | 03455487851 | Male   | true |
  | areebat      | areebat  | Areeba Tayyab | 16100222 | 03154585269 | Female | true |
  | hammadm      |hammadm   | Hammad Mazhar | 16100032 | 03322485721 | Male   | false|
  | alinam       | alinam   | Alina Mahmood | 16110568 | 03132545682 | Female | false|
  | maham        | maham    | Maha Munawar  | 16100020 | 03322485121 | Female | false|
  | alBato       | alBato   | Alishba Batool| 16110168 | 03238845682 | Female | false|

   And the following Users exist:
   | username | password | rollno   | phoneno     | gender |
   | hammadm  | hammadm  | 16100032 | 03322485721 | Male   |
   | alinam	 | alinam   | 16110568 | 03132545682 | Female |
  
   And the following Locations exist:
  | user_name | gps_latitude | gps_longitude | location |
  | usaidm      | 31.470855    | 74.412103     | M-6      |
  | aminas      | 31.380445    | 74.412103     | SSE      |
  
   And the following Kits exist:
  | location  | details 			| available |
  | SSE       | First Floor Lobby	| true		|
  | SportsCom | EMS Room            | false     |
  | Rec Room  | PDC stall			| true		|

 Scenario: get available kits
 Given I am on the home page
 And I am logged in as MFR "usaidm"
 When I press "Available Kits"
 Then I am on the available kits page
 And I should see "SSE"
 And I should see "Rec Room"
