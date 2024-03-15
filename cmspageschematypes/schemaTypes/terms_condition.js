import { defineField, defineType } from 'sanity';

export default defineType({
    name: 'termsConditon',
    Title: 'terms Conditon',
    type: 'document',

    fields: [
        defineField({
            name: 'Title',
            Title:'Terms and Conditions',
            type:'text',
        }),
    ],
})