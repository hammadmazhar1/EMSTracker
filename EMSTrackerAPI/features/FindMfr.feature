Feature: contact an MFR

  As a app user
  So that I can be helped in case of an emergency
  I want to be able to contact an MFR

Background: database status

  Given the following Users exist:
  | username     | password | name          | rollno   | phoneno     | gender | mfr  |
  | usaidm       | usaidm   | Usaid Mandvia | 16100215 | 03331310724 | Male   | true |
  | aminas       | aminas   | Amina Saeed   | 15110032 | 03216548927 | Female | true |
  | rashidm      | rashidm  | Rashid Minhas | 17100020 | 03455487851 | Male   | true |
  | areebat      | areebat  | Areeba Tayyab | 16100222 | 03154585269 | Female | true |
  | hammadm      |hammadm   | Hammad Mazhar | 16100032 | 03322485721 | Male   | false|
  | alinam       | alinam   | Alina Mahmood | 16110568 | 03132545682 | Female | false|
  | maham        | maham    | Maha Munawar  | 16100020 | 03322485121 | Female | false|
  | alBato       | alBato   | Alishba Batool| 16110168 | 03238845682 | Female | false|


  And the following Locations exist:
  | user_name | gps_latitude | gps_longitude | location |
  | usaidm      | 31.470855    | 74.412103     | M-6      |
  | aminas      | 31.380445    | 74.412103     | SSE      |
  
  And the following Kits exist:
  | location  | details 						| available |
  | SSE       | First Floor Lobby	  | true		    |
  | SportsCom | EMS Room            | false       |
  | Rec Room  | PDC stall						| true		    |

Scenario: get nearest MFR
	Given I am on the login page
	When I login as User "hammadm"
  Then I am on the details page for "hammadm"
	And my GPS coordinates are "31.470855", "73.412103"
	When I press "Get Help"
	Then I should see  "Usaid Mandvia"

