---
layout: page
nav_order: 1
title: Schedule
description: Listing of course modules and topics.
---

# CEE 260/MIE273\: Probability and Statistics in Engineering

## UMass Amherst, Fall 2026

{: .mb-2 .fs-6 .text-grey-dk-000 style="margin-top: 0;"  }
[Canvas](#TODO-canvas){:target="_blank" .btn .btn-canvas .mr-1 }
[Lecture Videos](#TODO-echo360){:target="_blank" .btn .btn-echo360 .mr-1 }
[Gradescope](#TODO-gradescope){:target="_blank" .btn .btn-gradescope .mr-1 }
[Overleaf/LaTeX](#TODO-overleaf){:target="_blank" .btn .btn-overleaf .mr-1 }
[Datahub](#TODO-datahub){:target="_blank" .btn .btn-datahub .mr-1 }
[LAB Solutions](#TODO-lab-solutions){:target="_blank" .btn .btn-labsolution .mr-1 }

<div>
{% assign instructors = site.staffers | where: 'role', 'Instructor' | sort: 'order' %}
  <div class="role">
    {% for staffer in instructors %}
    <!-- {% assign staffer.photo = staffer.photo | replace: '../', '' %} -->
    {{ staffer }}
    {% endfor %}
  </div>
</div>


### Schedule

{% for module in site.modules %}
{{ module }}
{% endfor %}
