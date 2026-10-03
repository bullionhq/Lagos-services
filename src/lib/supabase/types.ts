export type ServiceStatus = "pending" | "approved" | "rejected";

export interface Category {
  id: string;
  name: string;
  slug: string;
  created_at: string;
}

export interface Profile {
  id: string;
  user_id: string | null;
  name: string;
  bio: string | null;
  phone: string | null;
  whatsapp: string | null;
  location: string | null;
  avatar_url: string | null;
  created_at: string;
  updated_at: string;
}

export interface Service {
  id: string;
  profile_id: string;
  category_id: string;
  title: string;
  description: string;
  price: number | null;
  price_unit: string | null;
  images: string[] | null;
  status: ServiceStatus;
  created_at: string;
  updated_at: string;
}

export type Database = {
  public: {
    Tables: {
      categories: {
        Row: Category;
        Insert: Partial<Omit<Category, "id" | "created_at">>;
        Update: Partial<Omit<Category, "id">>;
      };
      profiles: {
        Row: Profile;
        Insert: Partial<Omit<Profile, "id" | "created_at" | "updated_at">>;
        Update: Partial<Omit<Profile, "id">>;
      };
      services: {
        Row: Service;
        Insert: Partial<Omit<Service, "id" | "created_at" | "updated_at" | "status">> & {
          status?: ServiceStatus;
        };
        Update: Partial<Omit<Service, "id">>;
      };
    };
    Views: {};
    Functions: {};
    Enums: {};
  };
};
