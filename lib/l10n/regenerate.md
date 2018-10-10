## Regenerating the l10n files

```
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localization/localization.dart
```

```
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n \
   --generated-file-prefix=intl_ --no-use-deferred-loading lib/*.dart lib/l10n/intl_*.arb
```
