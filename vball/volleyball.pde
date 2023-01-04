boolean hitGround(FBox ground) {
  ArrayList<FContact> contactList = circle.getContacts();
  int i = 0;
  while (i < contactList.size()) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(ground)) {
     return true; 
    }
    
    i++;
  }
  
  return false;
  
  
  
}

boolean hitGroundLeft(FBox ground) {
  ArrayList<FContact> contactList = box1.getContacts();
  int i = 0;
  while (i < contactList.size()) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(ground)) {
     return true; 
    }
    
    i++;
  }
  
  return false;
  
  
  
}
