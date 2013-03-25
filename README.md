# monograph

This is a little web site generator, just for me, so I can publish journal
entries, if I want.

It uses [hemingway](https://github.com/griffinmyers/hemingway) to parse individual
journal entries and a hacky treetop parser I rigged together just to parse my
journal structure.

# generally, how it works.

I've got this big latex document right? It's my journal, I'd like to share
it online with people. But I want to restrict what certain people can see.

So I need some from of authentication. But that doesn't mean I should get
involved with a dynamic site on rails or whatever, I'm still just serving up
static files, ideally.

Because there are only a handful of people who will want access to this, I could
just generate an index page of the journal for each person and put it in
its own directory with a `.htaccess` file to permission them.

# syntax
I put my authentication in latex comments inline with the journal.

At the top of the file I'll say something like

		% register: roymuntz password123
		% register: griffinmyers qwerty
		% whitelist: motherbear eastereggs

to register a user. If I register someone via the `whitelist` command then
it will opt them into seeing _every single post_. I must use that cautiously.

Then in a post (all my posts use the `\section{}` tag) I can say something like

		\section{March 24$^th$, 2013}
		% show: roymuntz
		Dear Journal, ....
		......
		....
		..
		.

whoop.