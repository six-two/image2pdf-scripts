# Image2PDF Scripts

Small helper scripts for making a PDF file out of images.

Scripts:

- `batch-crop.sh`: Crops multiple images
- `create-pdf.sh`: Converts multiple images into a PDF file. Each image becomes a DIN A4 sized page
- `fix-pdf-metadata.sh`: Clears old metadata, writes new metadata, and then linearizes the PDF.

## Dependencies

- `convert` (Arch: `imagemagick` package): Manipulates image file (croping, conversion, etc)
- `exiftool` (Arch: `perl-image-exiftool` package): Modify EXIF metadata
- `qpdf` (Arch: `qpdf` package): Linearize PDF files


### Other useful programs

`pdfunite` (Arch: `poppler` package): Joins / merges pdf files
