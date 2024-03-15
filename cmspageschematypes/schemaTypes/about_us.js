import { defineField, defineType } from 'sanity';

export default defineType({
    name: 'AboutUs',
    Title: 'AboutUs',
    type: 'document',

    fields: [
        defineField({
            name: 'Title',
            Title: 'Title',
            type: 'string',
            validation: Rule => Rule.required().max(10).error(
                'Ttitle should be maximum 10 characters long')
        }),
        defineField({
            name: 'content',
            Title: 'content',
            type: 'array',
            of: [
                {
                  type: 'block',
                  styles: [
                    { title: 'Normal', value: 'normal' },
                    { title: 'Heading 1', value: 'h1' },
                    { title: 'Heading 2', value: 'h2' },
                    { title: 'Heading 3', value: 'h3' },
                    { title: 'Quote', value: 'blockquote' },
                  ],
                  marks: {
                    decorators: [
                      { title: 'Bold', value: 'strong' },
                      { title: 'Italic', value: 'em' },
                      { title: 'Underline', value: 'underline' },
                    ],
                  },
                },]
        }),
        defineField({
            name: 'publishDatetime',
            title: 'Publish Date and Time',
            type: 'datetime',
            options: {
                dateFormat: 'YYYY-MM-DD',
                timeFormat: 'HH:mm',
                calendarTodayLabel: 'Today',
            },
            validation: Rule => Rule.required().min(
                new Date().toISOString()).error('Publish date must be set to current date and time ')
        }),
    ],
    preview: {
      select: {
        title: 'Title',
      },
    },
})