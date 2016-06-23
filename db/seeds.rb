User.delete_all
Post.delete_all
Comment.delete_all

u1 = User.create(
  username: 'bob'
)
u2 = User.create(
  username: 'antony'
)

p = Post.create(
  title: 'Teams: Work Better Together',
  user: u1,
  content: <<-POST
At DigitalOcean we know that it takes teamwork to build and ship great things to the world. Our own products wouldn’t exist without passionate, hard-working teams collaborating to create easy-to-use experiences for developers.

A year ago we launched Teams on DigitalOcean to “better support teams of developers and companies working on large-scale and established applications.” The first iteration focused on developer teams managing larger, more complex, production systems by organizing all of their infrastructure under one roof, with one invoice, and no shared credentials.
  POST
)

p.comments.create([
  { content: 'The resolvers which compose our authoritative DNS infrastructure are fronted by a well-known DDoS mitigation company.', post: p, user: u2 },
  { content: 'The service they offer uses anycast to move traffic from clients all across the world to DigitalOcean’s nearest datacenter. We then have authoritative resolvers in all of our facilities to process and respond to DNS queries.', post: p, user: u1 }
]
)

p = Post.create(
  title: 'Introducing doctl: the Command Line Interface to DigitalOcean',
  user: u1,
  content: <<-POST
When DigitalOcean entered the market four years ago, our team spent an extraordinary amount of time designing a web user interface that was easy to use and inviting for developers. Simple and elegant design is something we have always strived for as a company. Over time, as the amount of functionality has increased, the ease of use has remained.

That goal goes beyond just the web interface; we’ve sought to build an API that is just as easy to use. When we released version 1 of our API, a few popular tools emerged. Tugboat, which allowed you to manage your DigitalOcean resources from the comfort of your command line, was a particular favorite. Late last year, we deprecated V1 and released DigitalOcean API V2. With API V2 came a plethora of improvements and an enhanced developer’s portal which provides information on every API endpoint along with usage examples and guides.
  POST
)

p = Post.create(
  title: 'Update on the March 24, 2016 DNS Outage',
  user: u2,
  content: <<-POST
Yesterday, DigitalOcean’s DNS infrastructure was unavailable for two hours and four minutes. During this time we were only able to respond to a small fraction of the DNS requests sent to ns1, ns2, and ns3.digitalocean.com. We know how much you rely on DigitalOcean, and we take the availability and reliability of our services very seriously. We would like to apologize and share more details about our DNS system in general, this specific attack, and what we are doing to make our systems more resilient from here on.
  POST
)

p.comments.create(
  [
  { content: 'The resolvers which compose our authoritative DNS infrastructure are fronted by a well-known DDoS mitigation company.', post: p, user: u1 },
  { content: 'The service they offer uses anycast to move traffic from clients all across the world to DigitalOcean’s nearest datacenter. We then have authoritative resolvers in all of our facilities to process and respond to DNS queries.', post: p, user: u2 },
  { content: 'The resolvers which compose our authoritative DNS infrastructure are fronted by a well-known DDoS mitigation company.', post: p, user: u1 }
  ]
)

require 'securerandom'
1000.times do
  p.comments.create(content: SecureRandom.hex(200), post: p, user: u1)
end
