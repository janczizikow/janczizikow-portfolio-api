export interface Link {
  text: string;
  url: string;
}

export interface Project {
  id: number;
  name: string;
  date: string;
  slug: string;
  category: string;
  description: string;
  links: [Link];
  thumbnail: {
    url: string;
  };
  created_at: string;
  updated_at: string;
}
