---
title: "Blog"
---

<section class="mx-auto max-w-6xl px-4 pt-20">
  <ul class="grid grid-cols-1 gap-x-6 gap-y-6 sm:grid-cols-2 sm:gap-y-16 lg:grid-cols-3">
    {% for post in site.categories.blog %}
    <li class="{% if forloop.first %}col-span-full{% endif %}">
      <a href="{{ post.url }}">
        <div class="{% if forloop.first %}space-y-2 md:grid md:grid-cols-3 md:gap-4{% else %}space-y-2{% endif %}">
          <img alt="{{ post.title }}" loading="lazy" width="395" height="208" decoding="async" class="col-span-2 w-full object-cover rounded lg:rounded-md" style="color:transparent" src="{{ post.image }}">

          <div class="{% if forloop.first %}mt-2 lg:mt-0{% else %}col-span-2{% endif %}">

            <h2 class="{% if forloop.first %}lg:text-4xl{% endif %} text-xl font-bold text-zinc-900 dark:text-zinc-100">{{ post.title }}</h2>

            <div class="mt-2.5 flex items-center gap-1.5 md:gap-2 lg:mt-3">

              <img alt="Mot" loading="lazy" width="48" height="48" decoding="async" class="h-6 w-6 rounded-full object-cover" style="color:transparent" src="/assets/img/mot.png">

              <div class="flex gap-1">
                <p class="text-zinc-900 dark:text-zinc-100">Mot</p>
                <p class="text-zinc-500">
                  <time datetime="2023-09-14">· {{ post.date || date: "%B %d, %Y" }}</time>
                </p>
              </div>
            </div>
          </div>
        </div>
      </a>
    </li>
    {% endfor %}
  </ul>
</section>
