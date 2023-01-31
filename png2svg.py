#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys, os
from PIL import Image
import numpy as np
import svgwrite

def make_svg(im, filename):
    if im.mode != 'RGB':
        im = im.convert('RGB')
    data = np.array(im)
    h, w, _ = data.shape
    dwg = svgwrite.Drawing(filename, size=(w, h))
    for i in range(h):
        for j in range(w):
            r, g, b = data[i, j]
            dwg.add(dwg.rect(insert=(j, i), size=(1, 1), fill='rgb({}, {}, {})'.format(r, g, b)))
    dwg.save()

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Usage: {} image_file'.format(sys.argv[0]))
        sys.exit(1)
    filename = sys.argv[1]
    if not os.path.exists(filename):
        print('File {} does not exist'.format(filename))
        sys.exit(1)
    im = Image.open(filename)
    make_svg(im, filename + '.svg')
    