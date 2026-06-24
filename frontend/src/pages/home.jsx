import { HeroSection } from "../components/common/HeroSection";
import {Group} from "../components/common/Group";
import { Promotions } from "../components/common/Promotion";
import {Features} from "../components/common/Feature";
import {BestSellers} from "../components/common/BestSeller"
export default function Homepage() {
  return (
    <>
      <HeroSection />
      <Group />
      <Promotions />
      <BestSellers />
      <Features />
    </>
  );
}
