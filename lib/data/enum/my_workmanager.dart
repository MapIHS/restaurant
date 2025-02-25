enum MyWorkmanager {
  periodic("com.ihdev.restaurant", "com.ihdev.restaurant");

  final String uniqueName;
  final String taskName;

  const MyWorkmanager(this.uniqueName, this.taskName);
}
