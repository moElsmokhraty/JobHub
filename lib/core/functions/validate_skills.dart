List<String> validateSkills(List<String?> enteredSkills) {
  List<String> skills = [];
  for (int i = 0; i < enteredSkills.length; i++) {
    if (enteredSkills[i]!.isNotEmpty) {
      skills.add(enteredSkills[i]!);
    }
  }
  return skills;
}
