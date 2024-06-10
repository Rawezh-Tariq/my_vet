import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vet/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://zzpezxknqkswwwktavba.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp6cGV6eGtucWtzd3d3a3RhdmJhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTc2MDA3MjksImV4cCI6MjAzMzE3NjcyOX0.OMFMNI26d8VdPMRlMrKj3hofA4R7pOCsT12d1NFWStg',
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
